return {
    name = 'PowerState',
    description = 'The basic state of the system\'s power supply.',
    constants = {
        {
            name = 'unknown',
            description = 'Cannot determine power status.',
        },
        {
            name = 'battery',
            description = 'Not plugged in, running on a battery.',
        },
        {
            name = 'nobattery',
            description = 'Plugged in, no battery available.',
        },
        {
            name = 'charging',
            description = 'Plugged in, charging battery.',
        },
        {
            name = 'charged',
            description = 'Plugged in, battery is fully charged.',
        },
    },
}