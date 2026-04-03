import QtQuick

Canvas {
    id: waveCanvas
    width: 200
    height: 350

    // Force Hardware Acceleration in 6.10
    renderTarget: Canvas.FramebufferObject
    antialiasing: true

    property real fillLevel: 0.5
    property real animationOffset: 0

    // Smoothly animate the wave offset
    NumberAnimation on animationOffset {
        from: 0; to: 100; duration: 5000
        loops: Animation.Infinite
        running: true
    }

    // Trigger redraw when properties change
    onAnimationOffsetChanged: requestPaint()
    onFillLevelChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();

        var w = width;
        var h = height;
        var baseLevel = h * (1.0 - fillLevel);

        ctx.beginPath();
        ctx.moveTo(0, h); // Bottom Left
        ctx.lineTo(w, h); // Bottom Right
        ctx.lineTo(w, baseLevel); // Right wall height

        // Draw wave surface from Right to Left
        for (var x = w; x >= 0; x -= 5) {
            // Wave equation: Base + sin(x/freq + offset) * amplitude
            var y = baseLevel + Math.sin(x * 0.015 + animationOffset * 0.1) * 8;
            ctx.lineTo(x, y);
        }

        ctx.closePath();

        // Create a nice vertical gradient
        var gradient = ctx.createLinearGradient(0, baseLevel - 10, 0, h);
        gradient.addColorStop(0, "#4FC3F7"); // Lighter top
        gradient.addColorStop(1, "#01579B"); // Darker bottom

        ctx.fillStyle = gradient;
        ctx.fill();

        // Optional: Draw a glass outline
        ctx.strokeStyle = "#444";
        ctx.lineWidth = 4;
        ctx.strokeRect(0, 0, w, h);
    }
}