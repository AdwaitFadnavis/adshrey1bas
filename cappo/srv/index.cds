using {
    anubhav.db.master,
    anubhav.db.transaction
} from '../db/datamodel';

annotate transaction.purchaseorder with {
    NODE_KEY         @title : '{i18n>NODE_KEY}';
    PO_ID            @title : '{i18n>PO_ID}';
    PARTNER_GUID     @title : '{i18n>PARTNER_GUID}';
    LIFECYCLE_STATUS @title : '{i18n>OVERALL_STATUS}';
    OVERALL_STATUS   @title : '{i18n>OVERALL_STATUS}';
    NOTE             @title : '{i18n>note}';
};

annotate transaction.poitems with {
    PO_ITEM_POS  @title : '{i18n>po_items}';
    PRODUCT_GUID @title : '{i18n>PRODUCT_ID}';
};

annotate master.businesspartner with {
    COMPANY_NAME @title : '{i18n>COMPANY_NAME}'
};

annotate master.address with {
    COUNTRY @title : '{i18n>COUNTRY}'
};

annotate master.product with {
    PRODUCT_ID     @title : '{i18n>PRODUCT_ID}';
    PRICE          @title : '{i18n>PRICE}';
    CATEGORY       @title : '{i18n>CATEGORY}';
    DESCRIPTION    @title : '{i18n>DESCRIPTION}';
    SUPPLIER_GUID  @title : '{i18n>SUPPLIER_GUID}';
    TAX_TARIF_CODE @title : '{i18n>TAX_TARIF_CODE}';
    MEASURE_UNIT   @title : '{i18n>MEASURE_UNIT}';
    WEIGHT_MEASURE @title : '{i18n>WEIGHT_MEASURE}';
    DIM_UNIT       @title : '{i18n>DIM_UNIT}';
    WIDTH          @title : '{i18n>WIDTH}';
    HEIGHT         @title : '{i18n>HEIGHT}';
    DEPTH          @title : '{i18n>DEPTH}';
};
