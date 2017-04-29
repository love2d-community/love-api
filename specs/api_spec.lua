describe( 'LÖVE-API Integrity test', function()
    it( 'makes sure the api table is valid', function()
        local api = require( 'love_api' )
        assert( api )
    end)

    it( 'checks that all values are of type string', function()
        local api = require( 'love_api' )

        local function recursive( index, val )
            if type( val ) == 'table' then
                for i, v in pairs( val ) do
                    recursive( i, v )
                end
            elseif type( val ) ~= 'string' then
                print( index, val )
                assert.is_True( type( val ) == 'string' )
            end
        end
        recursive( nil, api )
    end)

    it( 'makes sure only certain keys are used', function()
        local api = require( 'love_api' )

        local valid_keys = {
            'api',
            'arguments',
            'callbacks',
            'config',
            'constants',
            'constructors',
            'default',
            'description',
            'enums',
            'functions',
            'modules',
            'name',
            'notes',
            'returns',
            'parenttype',
            'supertypes',
            'subtypes',
            'table',
            'type',
            'types',
            'variants',
            'version'
        }

        local function recursive( key, val )
            if type( key ) == 'string' then
                local valid = false;
                for i = 1, #valid_keys do
                    if key == valid_keys[i] then
                        valid = true;
                    end
                end
                if not valid then
                    print( key, val )
                end
                assert.is_True( valid );
            end

            if type( val ) == 'table' then
                for k, v in pairs( val ) do
                    recursive( k, v )
                end
            end
        end
        recursive( 'api', api )
    end)

    it( 'checks each argument is wrapped in a table', function()
        local api = require( 'love_api' )

        local function recursive( key, val )
            if key == 'arguments' then
                for _, v in pairs( val ) do
                    assert.is_True( type( v ) == 'table' )
                end
            end

            if type( val ) == 'table' then
                for k, v in pairs( val ) do
                    recursive( k, v )
                end
            end
        end
        recursive( 'api', api )
    end)

    it( 'checks each return value is wrapped in a table', function()
        local api = require( 'love_api' )

        local function recursive( key, val )
            if key == 'returns' then
                for _, v in pairs( val ) do
                    assert.is_True( type( v ) == 'table' )
                end
            end

            if type( val ) == 'table' then
                for k, v in pairs( val ) do
                    recursive( k, v )
                end
            end
        end
        recursive( 'api', api )
    end)
end)
