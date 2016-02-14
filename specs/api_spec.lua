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
end)
