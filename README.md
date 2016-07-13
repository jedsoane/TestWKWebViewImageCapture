# TestWKWebViewImageCapture
A demo iOS app to show a bug when rendering a WKWebView view of a webGL page to an image.

The app has a WKWebView that displays a web page containing some webGL content. drawViewHierarchyInRect is used to render the WKWebView to an image when the "Render to Image" button is tapped. This works fine on the simulator but on a phone the webGL content is not rendered to the image. The rest of the web page is rendered OK. On the phone the drawViewHierarchyInRect call returns false (the documentation says " returns false if the snapshot is missing image data for any view in the hierarchy").
