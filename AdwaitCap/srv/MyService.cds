using {Adwait.db} from '../db/datamodel';

service MyService @(path : 'MyService') {

    entity ProductSet as projection on db.Products;

}
