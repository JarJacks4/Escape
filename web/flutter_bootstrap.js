{{flutter_js}}
{{flutter_build_config}}

// Flutter 3.47 empties <img> elements CanvasKit may still draw from, which
// paints those images black (flutter/flutter#191800). Keep the engine's
// detached decode elements intact; the browser frees them once unreferenced.
(function () {
  var src = Object.getOwnPropertyDescriptor(HTMLImageElement.prototype, 'src');
  if (!src || !src.set) return;
  Object.defineProperty(HTMLImageElement.prototype, 'src', {
    configurable: true,
    enumerable: src.enumerable,
    get: src.get,
    set: function (value) {
      // Preserve loaded pixels, but allow pending loads to be cancelled.
      // Failed loads also report complete, so require an intrinsic width.
      if (
        value === '' &&
        !this.isConnected &&
        this.complete &&
        this.naturalWidth > 0
      ) {
        return;
      }
      src.set.call(this, value);
    },
  });
})();

_flutter.loader.load(
    {
        onEntrypointLoaded: async function(engineInitializer) {
            // Initialize the Flutter engine
            let appRunner = await engineInitializer.initializeEngine({useColorEmoji: true,});
            // Run the app
            await appRunner.runApp();
          }
    }
);
