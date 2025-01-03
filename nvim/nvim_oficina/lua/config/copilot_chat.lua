require('CopilotChat').setup({
    model = 'claude-3.5-sonnet',
    question_header = '## NeanderTech: ',
    answer_header = '## Quaker State: ',
    error_header = '## Error: ',
    separator = '<><><><>',

    window = {
        layout = 'vertical',
        relative = 'cursor',
        width = 0.5,
        height = 0.4,
        row = 1,
        border = 'rounded',
        title = 'Copilot Chat',
        footer = 'For NeanderTech',
        zindex = 1,
    },

    prompts = {
        Explain = {
            prompt = '/COPILOT_EXPLAIN Escribe una explicación para el código seleccionado',
        },
        Refactor = {
            prompt = '/COPILOT_GENERATE Remueve los echos que imprimen html, en lugar de eso, abre y cierra el código PHP',
        },
        Optimize = {
            prompt = '/COPILOT_GENERATE Dame una versión modificada y mejorada del código',
        },
    }
})
