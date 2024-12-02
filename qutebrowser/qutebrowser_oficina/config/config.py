config.load_autoconfig(False)

# Binding para abrir la configuración
config.bind(';e', 'config-edit')

# Binding para Prueba de comando

config.bind(',t', 'spawn -u tumblelog-wrapper.cmd')

config.set('statusbar.widgets', ['url', 'scroll', 'history', 'tabs', 'progress' , 'text:NeanderTech','clock'])

# Configuración del editor para abrir archivos
c.editor.command = ['C:\Program Files\Vim\\vim91\gvim.exe', '{file}']

# Página de inicio (puerto localhost para el servidor PHP)
c.url.start_pages = ['https://neanderpruebas.com','https://phind.com', 'https://erp.en-trega.com/en-trega/principal.php', 'https://app.daily.dev']

# Motor de búsqueda predeterminado
c.url.searchengines = {'DEFAULT': 'https://www.duckduckgo.com/search?q={}',
                       'g': 'https://www.google.com/search?q={}',
                       'yt': 'https://www.youtube.com/results?search_query={}',
                       'b': 'https://www.bing.com/search?q={}',
                       'gs': 'https://github.com/search?q={}',
                       'p': 'https://www.phind.com/search?q={}'}

# Bloqueo de anuncios activado
c.content.blocking.enabled = True

# Habilitar el uso de la consola de desarrollo (DevTools)
c.content.default_encoding = 'utf-8'

# Configurar el User-Agent para evitar problemas de compatibilidad
c.content.headers.user_agent = 'cloudflare 503 workaround'

# Habilitar JavaScript en todas las páginas para que los console.log funcionen
c.content.javascript.enabled = True

# Atajo para cambiar a la siguiente pestana
config.bind('<Ctrl-p>', 'tab-next', mode='normal')

# Atajo para cambiar a la siguiente pestana
config.bind('<Ctrl-o>', 'tab-prev', mode='normal')

# Atajo para ir hacia atrás en el historial
config.bind('<backspace>', 'back', mode='normal')

# Habilitar la carga de imágenes
c.content.images = True

# Habilitar el almacenamiento de cookies
c.content.cookies.accept = 'all'

# Configurar un esquema de colores personalizado
# Color principal (fondo de la barra de estado y las pestañas)

# Color de texto en la barra de estado

# Color de la pestaña seleccionada

# Color de las pestañas no seleccionadas

# Color de la barra de comandos

# Color del texto de las sugerencias de autocompletar

# Color de la barra de mensajes

# Color del indicador de descargas

# Habilitar la apertura de los enlaces en pestañas nuevas en segundo plano
c.tabs.background = True

c.content.tls.certificate_errors = 'ask-block-thirdparty'
config.set('content.tls.certificate_errors', 'load-insecurely', '*://*.neanderpruebas.com/*')
config.source('qutebrowser-ntech.py')
