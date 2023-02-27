using {
    anubhav.db.master,
    anubhav.db.transaction
} from '../db/datamodel';


service MyService @(path: 'MyService') {
    @readonly
    entity ReadEmoloyeeSet   as projection on master.employees;

    // @insertonly
    entity InsertEmoloyeeSet as projection on master.employees;

    @updateonly
    entity UpdateEmoloyeeSet as projection on master.employees;

    @deleteonly
    entity DeleteEmoloyeeSet as projection on master.employees;

}
