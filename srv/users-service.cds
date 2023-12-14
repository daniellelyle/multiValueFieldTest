using db from '../db/schema';

service UsersService {
    entity Users as projection on db.Users;
    entity Countries   as projection on db.Countries;
}