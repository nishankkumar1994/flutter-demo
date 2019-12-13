import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

// Future<void> main() async {
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//   print('-----cameras');
//   print(cameras);

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//   print('-----firstCamera');
//   print(firstCamera);

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const TakePictureScreen({
//     Key key,
//     this.camera,
//   }) : super(key: key);

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   CameraController _controller;
//   Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Take a picture')),
//       // Wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner
//       // until the controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator.
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt),
//         // Provide an onPressed callback.
//         onPressed: () async {
//           print('------just pressed');
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             print('------after try');
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Construct the path where the image should be saved using the
//             // pattern package.
//             print('------DateTime.now()');
//             print(DateTime.now());
//             final path = join(
//               // Store the picture in the temp directory.
//               // Find the temp directory using the `path_provider` plugin.
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );

//             // Attempt to take a picture and log where it's been saved.
//             await _controller.takePicture(path);
//             print('------path');
//             print(path);
//             // If the picture was taken, display it on a new screen.
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: path),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.file(File(imagePath)),
            RaisedButton(
              child: Text(
                // buttonName,
                'Share',
                textDirection: TextDirection.ltr,
                // style: buttonTextStyle
              ),
              onPressed: () {
                getBytesFromFile().then((bytes) {
                  Share.file('Share via:', imagePath,
                      bytes.buffer.asUint8List(), 'image/png');
                });
              },
            )
          ]
        )
      ),
    );
  }
}

class TakePictureScreen extends StatefulWidget {
  @override
  createState() => _CameraScreenState();
  // Widget build(BuildContext context) {
  //   return _myListView(context);
  // }
}

class _CameraScreenState extends State {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    // 1
    availableCameras().then((availableCameras) {
      
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          // 2
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });
  }
  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    // 3
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    // 4
    controller.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    // 6
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }
 
  @override
  build(context) {
    return _cameraPreviewWidget();
  }
 
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
  }
  void _onCapturePressed(context) async {
    try {
      // 1
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      // 2
      await controller.takePicture(path);
      // 3
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  
  
}
