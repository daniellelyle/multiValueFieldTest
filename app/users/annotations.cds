using UsersService as service from '../../srv/users-service';
using from '../../db/schema';

annotate service.Users with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : countries.country_code,
            Label : 'Countries',
        },
    ]
);
annotate service.Users with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : countries.country_code,
                Label : 'Countries',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Users.countries with {
    country @Common.Text : {
            $value : country.name,
            ![@UI.TextArrangement] : #TextFirst,
        }
};
