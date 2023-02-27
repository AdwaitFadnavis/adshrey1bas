using {db} from '../db/datamodel';

service MyService @(path : 'MyService', requires: 'authenticated-user') {
    entity ProductSet  as projection on db.Products;
    // @(restrict: [
    //     //  { grant: 'READ', to: 'Viewer' },
    //      { grant: ['READ','WRITE'], to: 'Editor' }
    // ])

}
