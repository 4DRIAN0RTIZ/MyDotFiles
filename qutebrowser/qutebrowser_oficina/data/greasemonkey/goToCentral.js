// ==UserScript==
// @name         NeanderBoard
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Añade un botón en la esquina superior derecha que redirige a "neanderpruebas.com"
// @author       Adrian
// @match        *://*/*
// @exclude      *://neanderpruebas.com/
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Crear el botón
    let button = document.createElement('a');
    button.href = 'https://neanderpruebas.com';
    button.textContent = 'NeanderBoard';

    // Aplicar estilos al botón
    button.style.position = 'fixed';
    button.style.top = '10px';
    button.style.right = '10px';
    button.style.padding = '10px 15px';
    button.style.backgroundColor = 'var(--accent-color)';
    button.style.color = 'var(--text-color)';
    button.style.textDecoration = 'none';
    button.style.borderRadius = '5px';
    button.style.boxShadow = '0 4px 6px var(--shadow-color)';
    button.style.zIndex = '1000';
    button.style.transition = 'background-color 0.3s ease';

    // Estilo para el hover
    button.onmouseover = function() {
        button.style.backgroundColor = 'var(--accent-hover)';
    };
    button.onmouseout = function() {
        button.style.backgroundColor = 'var(--accent-color)';
    };

    // Añadir el botón al body
    document.body.appendChild(button);

    // Definir las variables CSS (en caso de que no estén en la página)
    const rootStyle = document.documentElement.style;
    rootStyle.setProperty('--bg-color', '#1c1c1e');
    rootStyle.setProperty('--container-bg', '#2c2c2e');
    rootStyle.setProperty('--text-color', '#e0e0e0');
    rootStyle.setProperty('--accent-color', '#ff7849');
    rootStyle.setProperty('--accent-hover', '#ff9966');
    rootStyle.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.3)');
})();