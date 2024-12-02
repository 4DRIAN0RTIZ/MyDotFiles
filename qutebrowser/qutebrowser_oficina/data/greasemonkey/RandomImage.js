// ==UserScript==
// @name         Cambiar Imagen Aleatoria en Segunda Tabla y Notificación con LocalStorage
// @namespace    http://tampermonkey.net/
// @version      1.3
// @description  Cambia la imagen de la primera celda en la segunda tabla y el ícono de notificación, y guarda las imágenes en localStorage.
// @author       Adrian
// @match        https://neanderpruebas.com/erp-pruebas/principal.php
// @match        https://neanderpruebas.com/erp-productivo/principal.php
// @match        https://erp.en-trega.com/en-trega/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Array de URLs de las imágenes
    const imagenes = [
        'https://img.freepik.com/vector-premium/vector-dibujado-mano-estilo-nft-ilustracion-mono_1174912-11163.jpg?w=360',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWlvZ4TFZQ3ykrNPLWz9MX3Bu4VQ8dY4C0Kg&s',
        'https://play-lh.googleusercontent.com/2zorpA9peRFcwZM5SLSAx80gLCA3YrknRXQwPW-Hz2AJyBcvBJiO9vuP6DvlX3FRZXMv=w526-h296-rw',
        'https://play-lh.googleusercontent.com/2zorpA9peRFcwZM5SLSAx80gLCA3YrknRXQwPW-Hz2AJyBcvBJiO9vuP6DvlX3FRZXMv=w526-h296-rw'
    ];

    // Función para seleccionar una imagen aleatoria del array
    function imagenAleatoria() {
        return imagenes[Math.floor(Math.random() * imagenes.length)];
    }

    // Función para obtener la imagen desde localStorage
    function obtenerImagenGuardada(key) {
        return localStorage.getItem(key);
    }

    // Función para guardar la nueva imagen en localStorage
    function guardarImagenEnLocalStorage(key, src) {
        localStorage.setItem(key, src);
    }

    // Función que gestiona el proceso de cambio y almacenamiento de las imágenes
    function manejarCambioDeImagen(key, imgElement, aplicarBordes = false) {
        const imagenGuardada = obtenerImagenGuardada(key);
        if (imagenGuardada) {
            // Mostrar la imagen guardada
            imgElement.src = imagenGuardada;
            console.log(`Imagen cargada desde localStorage para ${key}: ` + imagenGuardada);
        }

        // Seleccionar una nueva imagen aleatoria
        const nuevaImagen = imagenAleatoria();
        imgElement.src = nuevaImagen;

        // Guardar la nueva imagen en localStorage
        guardarImagenEnLocalStorage(key, nuevaImagen);
        console.log(`Nueva imagen seleccionada y guardada en localStorage para ${key}: ` + nuevaImagen);

        // Aplicar border-radius si es necesario
        if (aplicarBordes) {
            imgElement.style.borderRadius = "10% 20px 30% 20px / 30% 20px 40% 10px";
        }
    }

    // Esperar a que el DOM esté completamente cargado
    window.addEventListener('load', function() {
        console.log("DOM Cargado");

        // Obtener todas las tablas en la página
        const tablas = document.getElementsByTagName('table');

        // Verificar si hay al menos dos tablas en la página
        if (tablas.length >= 2) {
            console.log("Hay suficientes tablas, procesando la segunda tabla");

            // Obtener la segunda tabla
            const segundaTabla = tablas[2];

            // Buscar el primer td de la segunda tabla
            const primerTd = segundaTabla.querySelector('td');
            console.log("Primer TD encontrado:", primerTd);

            // Verificar si el primer TD tiene alguna imagen dentro
            if (primerTd) {
                const img = primerTd.querySelector('img');

                if (img) {
                    // Manejar el cambio de imagen con localStorage
                    manejarCambioDeImagen('tablaImagenSrc', img, true);
                } else {
                    console.log('No se encontró ninguna imagen en el primer td.');
                }
            } else {
                console.log('No se encontró el primer td en la segunda tabla.');
            }
        } else {
            console.log('No se encontraron suficientes tablas en la página.');
        }

        // Buscar la imagen dentro del elemento con id="notifi-icon"
        const notifiIcon = document.querySelector('#notifi_icon img');
        if (notifiIcon) {
            // Manejar el cambio de imagen en el ícono de notificación
            manejarCambioDeImagen('notifiIconImagenSrc', notifiIcon);
        } else {
            console.log('No se encontró la imagen dentro del ícono de notificación.');
        }
    });

})();