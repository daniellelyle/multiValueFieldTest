namespace db;

@odata.draft.enabled
entity Users {
    key name      : String(255);
        countries : Composition of many {
                        key country : Association to Countries;
                    }
}

@cds.odata.valuelist
entity Countries {
    key code      : String(3);
        name      : String(255);
        continent : String(255);
        users     : Association to many Users.countries
                        on users.country = $self;
}
