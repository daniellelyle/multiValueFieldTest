namespace db;

@odata.draft.enabled
entity Users {
    key name      : String(255);
        countries : Composition of many {
                        key country : Association to Countries;
                    }
        country   : String @Common: {
            Text: countryName,
            TextArrangement : #TextSeparate,
            ValueList : {
                CollectionPath : 'Countries',
                Label: 'Value Help',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : country,
                        ValueListProperty : 'code',
                    },
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : countryName,
                        ValueListProperty : 'name',
                    },
                ],
            },
        };
        countryName : String;
}

@cds.odata.valuelist
entity Countries {
    key code      : String(3) @Common: {
        Text: name,
        TextArrangement : #TextSeparate,
    };
        name      : String(255);
        continent : String(255);
        users     : Association to many Users.countries
                        on users.country = $self;
}
