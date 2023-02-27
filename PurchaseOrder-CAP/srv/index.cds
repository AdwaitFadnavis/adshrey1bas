using {
    anubhav.db.master,
    anubhav.db.transaction
} from '../db/DataModel';

annotate transaction.purchaseorder with {
    PO_ID            @title : '{i18n>PO_ID}';
    PARTNER_GUID     @title : '{i18n>partner_guid}';
    LIFECYCLE_STATUS @title : '{i18n>LIFECYCLE_STATUS}';
    OVERALL_STATUS   @title : '{i18n>overall_status}';
    NOTE             @title : '{i18n>note}';

};
