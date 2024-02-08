import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {




  return (context) async {
    
    print('Default handler');
    // Execute code before request is handled.
    // handler.use(requestLogger()).use(
    //       fromShelfMiddleware(
    //         shelf.corsHeaders(
    //           headers: {
    //             shelf.ACCESS_CONTROL_ALLOW_ORIGIN:
    //                 context.request.uri.toString(), // test url here if not working
    //           },
    //         ),
    //       ),
    //     );
    // Forward the request to the respective handler.
    final response = await handler(context);

    // Execute code after request is handled.

    // Return a response.
    return response;
  };
}
