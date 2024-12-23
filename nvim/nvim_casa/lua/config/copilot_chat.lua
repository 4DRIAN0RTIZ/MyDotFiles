require('CopilotChat').setup({
    question_header = '## NeanderTech: ',
    answer_header = '## Copilot: ',
    error_header = '## Error: ',
    separator = '<><><><>',

    window = {
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
        }
    }
})
