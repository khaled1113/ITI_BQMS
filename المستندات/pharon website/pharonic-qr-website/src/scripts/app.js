// This file contains the JavaScript code that generates a QR code when the user visits the website.

document.addEventListener("DOMContentLoaded", function() {
    const qrCodeContainer = document.getElementById("qr-code");
    const generateButton = document.getElementById("generate-qr");
    const inputField = document.getElementById("qr-input");

    generateButton.addEventListener("click", function() {
        const qrText = inputField.value;
        if (qrText) {
            generateQRCode(qrText);
        } else {
            alert("Please enter a value to generate a QR code.");
        }
    });

    function generateQRCode(text) {
        qrCodeContainer.innerHTML = ""; // Clear previous QR code
        const qrCode = new QRCode(qrCodeContainer, {
            text: text,
            width: 128,
            height: 128,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
        });
    }
});