// ==UserScript==
// @name        NeanderDevBar
// @namespace   https://4drian0rtiz.github.io
// @version     1.5
// @description Add a dev sidebar with options and dev tools
// @author      NeanderTech
// @match       *://localhost:*/*
// @match       https://neanderpruebas.com/erp-pruebas/
// @grant       GM_getValue
// @grant       GM_setValue
// @grant       GM_registerMenuCommand
// @license     MIT
// ==/UserScript==

(function () {
  "use strict";

  // Config Data
  const defaultHide = GM_getValue("defaultHide", true);

  // Define styles
  const styles = `
  #custom-modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    justify-content: center;
    align-items: center;
    backdrop-filter: blur(10px);
  }
  #custom-modal-content {
    background: linear-gradient(145deg, #2e026d, #6c25d4);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px #f72585, 0px 0px 30px #7209b7, 0px 0px 50px #4361ee;
    max-width: 80%;
    max-height: 80%;
    overflow: auto;
    color: #ffffff;
    font-family: 'Orbitron', sans-serif;
  }
  #custom-modal button {
    display: block;
    margin: 10px auto 0;
    padding: 10px;
    background-color: #ff007f;
    color: #000;
    border: none;
    border-radius: 5px;
    box-shadow: 0px 0px 10px #f72585;
  }
  .button {
    display: block;
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    background: linear-gradient(90deg, #ff007f, #f72585);
    color: white;
    border: none;
    border-radius: 5px;
    box-shadow: 0px 0px 10px #f72585;
    font-family: 'Orbitron', sans-serif;
  }
  .input, .select, .textarea {
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    background-color: #240046;
    color: #ff99c8;
    font-family: 'Orbitron', sans-serif;
  }
  .checkbox-label {
    font-size: medium;
    color: #ff99c8;
  }
  .toggle-button {
    position: fixed;
    top: 50%;
    right: 0;
    width: 48px;
    height: 48px;
    background-color: #480ca8;
    border: none;
    cursor: pointer;
    border-radius: 50%;
    box-shadow: 0px 0px 20px #ff007f;
    transition: all 0.3s ease;
  }
  .toggle-button:hover {
    box-shadow: 0px 0px 40px #f72585;
  }
  .toggle-button img {
    filter: drop-shadow(0px 0px 10px #ff007f);
  }
`;


  // Insert styles into the document
  const styleSheet = document.createElement("style");
  styleSheet.type = "text/css";
  styleSheet.innerText = styles;
  document.head.appendChild(styleSheet);

 // Create a container with a background that matches the color palette
  const container = document.createElement("div");
  container.style.cssText = `position: fixed; top: 35%; right: ${
    defaultHide ? "-520px" : "0"
  }; width: 550px; height: fit-content; padding: 10px;`;

  // Create a container for the sidebar
  const sidebar = document.createElement("div");
  sidebar.style.cssText = `position: fixed; top: 25%; right: ${
    defaultHide ? "-700px" : "0"
  }; width: 500px; height: fit-content; background-color: #463f3a; padding: 10px; border-left: 1px solid #ddd; overflow:hidden; border-radius: 4% 2% 5% 4% / 4% 3% 3% 6%`;

  // Create tools section
  const toolsSection = document.createElement("div");
  toolsSection.className = "tools-section";

  // Useful Functions
  // Function to format JSON with colors
  function formatJsonWithColors(json) {
    return JSON.stringify(json, null, 2)
      .replace(/"(.*?)":/g, '<span style="color: #ffca00;">"$1"</span>:')
      .replace(/: "(.*?)"/g, ': <span style="color: #b3ff4b;">"$1"</span>')
      .replace(/: (\d+)/g, ': <span style="color: #b3ff4b;">$1</span>')
      .replace(
        /: (null|true|false)/g,
        ': <span style="color: #b3ff4b;">$1</span>'
      );
  }

  // Function to display modal with formatted JSON
  function displayModalWithJson(json) {
    const modal = document.getElementById("custom-modal");
    const modalContent = document.getElementById("custom-modal-content");
    const toggleButtonSidebar = document.getElementById("toggleButtonSidebar");

    modalContent.innerHTML = `<pre style="white-space: pre-wrap; word-wrap: break-word; color:white;">${formatJsonWithColors(
      json
    )}</pre>`;
    modal.style.display = "flex";

    // Simulate a click on the button with id "toggleButtonSidebar"
    if (toggleButtonSidebar) {
      toggleButtonSidebar.click();
    }
  }

  // Create the modal if it doesn't exist
  if (!document.getElementById("custom-modal")) {
    const modal = document.createElement("div");
    modal.id = "custom-modal";

    const modalContent = document.createElement("div");
    modalContent.id = "custom-modal-content";

    const modalCloseButton = document.createElement("button");
    modalCloseButton.textContent = "Cerrar";

    modalContent.appendChild(modalCloseButton);
    modal.appendChild(modalContent);
    document.body.appendChild(modal);

    modalCloseButton.addEventListener("click", () => {
      modal.style.display = "none";
      sidebar.style.display = "block";
    });

    modal.addEventListener("click", (event) => {
      if (event.target === modal) {
        modal.style.display = "none";
        sidebar.style.display = "block";
      }
    });

    document.addEventListener("keydown", (event) => {
      if (event.key === "Escape") {
        modal.style.display = "none";
        sidebar.style.display = "block";
      }
    });
  }

  // Append tools section to sidebar
  sidebar.appendChild(toolsSection);

  // Function to toggle visibility of sections
  function toggleSection(section) {
    const sections = toolsSection.querySelectorAll("div");
    sections.forEach((sec) => {
      if (sec !== section) {
        sec.style.display = "none";
      }
    });
    section.style.display =
      section.style.display === "block" ? "none" : "block";
  }

  // ==============================
  // 1. Inspector de Consultas SQL (Últimos Errores de Consultas)
  // ==============================

  const sqlLogButton = document.createElement("button");
  sqlLogButton.textContent = "Ver Logs de Consultas SQL";
  sqlLogButton.className = "button";

  const sqlLogSection = document.createElement("div");
  sqlLogSection.style.display = "none";

  const numLogsInput = document.createElement("input");
  numLogsInput.type = "number";
  numLogsInput.placeholder = "Cantidad de logs";
  numLogsInput.className = "input";

  const orderSelect = document.createElement("select");
  const ascOption = document.createElement("option");
  ascOption.value = "asc";
  ascOption.textContent = "Ascendente";
  const descOption = document.createElement("option");
  descOption.value = "desc";
  descOption.textContent = "Descendente";
  orderSelect.appendChild(ascOption);
  orderSelect.appendChild(descOption);
  orderSelect.className = "select";

  // Checkbox for selecting database
  const dbCheckboxLogs = document.createElement("input");
  dbCheckboxLogs.type = "checkbox";
  dbCheckboxLogs.id = "dbCheckboxLogs";
  const dbCheckboxLabelLogs = document.createElement("label");
  dbCheckboxLabelLogs.htmlFor = "dbCheckboxLogs";
  dbCheckboxLabelLogs.textContent = "Producción";
  dbCheckboxLabelLogs.className = "checkbox-label";

  // Checkbox for file
  const fileCheckbox = document.createElement("input");
  fileCheckbox.type = "checkbox";
  fileCheckbox.id = "fileCheckbox";
  const fileCheckboxLabel = document.createElement("label");
  fileCheckboxLabel.htmlFor = "fileCheckbox";
  fileCheckboxLabel.textContent = "Este archivo";
  fileCheckboxLabel.className = "checkbox-label";

  // Get Name of current file
  const url = window.location.href;
  const fileName = url.substring(url.lastIndexOf("/") + 1);

  const fetchSqlLogsButton = document.createElement("button");
  fetchSqlLogsButton.className = 'sendButton';
  fetchSqlLogsButton.textContent = "Enviar";
  fetchSqlLogsButton.className = "button";

  sqlLogButton.addEventListener("click", () => {
    toggleSection(sqlLogSection);
  });

  fetchSqlLogsButton.addEventListener("click", () => {
    const numLogs = numLogsInput.value || 10;
    const order = orderSelect.value || "desc";
    const useProdDb = !dbCheckboxLogs.checked;
    const file = fileCheckbox.checked ? fileName : null;

    const requestBody = {
      num_logs: parseInt(numLogs, 10),
      recent: order === "desc",
      use_prod_db: useProdDb,
    };

    if (file) {
      requestBody.file = file;
    }

    fetch("http://localhost:5000/api/sqlLog", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(requestBody),
    })
      .then((response) => response.json())
      .then((logs) => {
        displayModalWithJson(logs);
      })
      .catch((error) => {
        displayModalWithJson({ error: error.message });
      });
  });

  sqlLogSection.appendChild(numLogsInput);
  sqlLogSection.appendChild(orderSelect);
  sqlLogSection.appendChild(dbCheckboxLogs);
  sqlLogSection.appendChild(dbCheckboxLabelLogs);
  sqlLogSection.appendChild(fileCheckbox);
  sqlLogSection.appendChild(fileCheckboxLabel);
  sqlLogSection.appendChild(fetchSqlLogsButton);

  // ==============================
  // 2. Monitoreo de Logs de Errores PHP (con prompt)
  // ==============================
  const showPhpLogsButton = document.createElement("button");
  showPhpLogsButton.textContent = "Mostrar Logs PHP";
  showPhpLogsButton.className = "button";
  showPhpLogsButton.addEventListener("click", async () => {
    const response = await fetch("http://localhost/api/phpLogs"); // Endpoint que devuelve los logs PHP
    const logs = await response.json();
    alert("Logs PHP: " + JSON.stringify(logs));
  });

  // ==============================
  // 3. Ejecución de Consultas SQL con textarea
  // ==============================

  const runSqlButton = document.createElement("button");
  runSqlButton.textContent = "Ejecutar SQL";
  runSqlButton.className = "button";

  const runSqlSection = document.createElement("div");
  runSqlSection.style.display = "none";

  const sqlTextArea = document.createElement("textarea");
  sqlTextArea.placeholder = "Escribe tu consulta SQL aquí...";
  sqlTextArea.className = "textarea";

  // Checkbox for selecting database
  const dbCheckboxQuery = document.createElement("input");
  dbCheckboxQuery.type = "checkbox";
  dbCheckboxQuery.id = "dbCheckboxQuery";
  const dbCheckboxLabelQuery = document.createElement("label");
  dbCheckboxLabelQuery.htmlFor = "dbCheckboxQuery";
  dbCheckboxLabelQuery.textContent = "Producción";
  dbCheckboxQuery.className = "input";
  dbCheckboxLabelQuery.className = "checkbox-label";

  const runSqlSubmitButton = document.createElement("button");
  runSqlSubmitButton.className = 'sendButton';
  runSqlSubmitButton.textContent = "Enviar Consulta SQL";
  runSqlSubmitButton.className = "button";

  runSqlButton.addEventListener("click", () => {
    toggleSection(runSqlSection);
  });

  runSqlSubmitButton.addEventListener("click", () => {
    const query = sqlTextArea.value;
    const useProdDb = !dbCheckboxQuery.checked;
    if (query) {
      fetch("http://localhost:5000/api/sqlQuery", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ query, use_prod_db: useProdDb }),
      })
        .then((response) => response.json())
        .then((data) => {
          displayModalWithJson(data);
        })
        .catch((error) => {
          displayModalWithJson({ error: error.message });
        });
    }
  });

  runSqlSection.appendChild(sqlTextArea);
  runSqlSection.appendChild(dbCheckboxQuery);
  runSqlSection.appendChild(dbCheckboxLabelQuery);
  runSqlSection.appendChild(runSqlSubmitButton);

  // ==============================
  // 4. Herramienta de Validación de Código PHP con textarea
  // ==============================
  const validatePhpButton = document.createElement("button");
  validatePhpButton.textContent = "Validar Código PHP";
  validatePhpButton.className = "button";

  const validatePhpSection = document.createElement("div");
  validatePhpSection.style.display = "none";

  const phpTextArea = document.createElement("textarea");
  phpTextArea.placeholder = "Pega tu código PHP aquí...";
  phpTextArea.className = "textarea";

  const validatePhpSubmitButton = document.createElement("button");
  validatePhpSubmitButton.textContent = "Validar Código PHP";
  validatePhpSubmitButton.className = "button";

  validatePhpButton.addEventListener("click", () => {
    toggleSection(validatePhpSection);
  });

  validatePhpSubmitButton.addEventListener("click", async () => {
    const phpCode = phpTextArea.value;
    if (phpCode) {
      const response = await fetch("http://localhost/api/validatePhp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ code: phpCode }),
      });
      const result = await response.json();
      alert("Resultado de validación: " + JSON.stringify(result));
    }
  });

  validatePhpSection.appendChild(phpTextArea);
  validatePhpSection.appendChild(validatePhpSubmitButton);

  // ==============================
  // 6. Modificación de Sesión de Usuario (con prompt)
  // ==============================
  const simulateSessionButton = document.createElement("button");
  simulateSessionButton.textContent = "Modificar Sesión de Usuario";
  simulateSessionButton.className = "button";
  simulateSessionButton.addEventListener("click", async () => {
    const newLoginValue = prompt("Con que usuario quieres ver esta página:");
    if (newLoginValue) {
      const response = await fetch(
        "http://localhost:3000/include/updateSession.php",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ login: newLoginValue }),
        }
      );
      const result = await response.json();
      if (result.status === "success") {
        alert("Session cambiada a: " + newLoginValue);
        location.reload();
      } else {
        alert("Error al modificar la sesión: " + result.message);
      }
    }
  });

  // Append buttons and sections to tools section
  toolsSection.appendChild(sqlLogButton);
  toolsSection.appendChild(sqlLogSection);
  //toolsSection.appendChild(showPhpLogsButton);
  toolsSection.appendChild(runSqlButton);
  toolsSection.appendChild(runSqlSection);
  //toolsSection.appendChild(validatePhpButton);
  //toolsSection.appendChild(validatePhpSection);
  toolsSection.appendChild(simulateSessionButton);

  // Add tools section to sidebar
  sidebar.appendChild(toolsSection);

  // Create a toggle button
  const button = document.createElement("button");
  button.id = "toggleButtonSidebar";
  button.className = "toggle-button";
  button.innerHTML =
    '<svg viewBox="0 0 36 36" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"><image width="36" height="36" xlink:href="https://cuevaneander.tech/img/cueva_neandertech.png"/></svg>';
  container.appendChild(button);

  // Define a function for toggling the sidebar
  const toggleSidebar = () => {
    if (hide) {
      sidebar.style.transition = "all 0.2s ease-in-out";
      container.style.transition = "all 0.2s ease-in-out";
      container.style.right = "0";
      sidebar.style.right = "0";
      hide = false;
    } else {
      sidebar.style.transition = "all 0.2s ease-in-out";
      container.style.transition = "all 0.2s ease-in-out";
      container.style.right = `-${currentWidth}px`;
      sidebar.style.right = `-${currentWidth}px`;
      hide = true;
    }
  };

  // Add an event listener for when the button is clicked
  button.addEventListener("click", (e) => {
    e.preventDefault();
    toggleSidebar();
  });

  // Add the sidebar to the page
  container.appendChild(sidebar);
  document.body.appendChild(container);

  // Initialize variables for tracking mouse movements
  let currentWidth = parseInt(sidebar.style.width);
  currentWidth += 30;
  let hide = defaultHide;

  // Configuración
  GM_registerMenuCommand(
    "¿Ocultar barra lateral por defecto?: " +
      (defaultHide ? "✅ Ocultar" : "❌ Mostrar"),
    () => {
      GM_setValue("defaultHide", !defaultHide);
    }
  );
})();