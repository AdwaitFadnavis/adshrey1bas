namespace db;

entity Products {
    key ProductID       : String;
        ProductName     : String;
        SupplierID      : String;
        CategoryID      : String;
        QuantityPerUnit : String;
        UnitPrice       : String;
        UnitsInStock    : String;
        UnitsOnOrder    : String;
        ReorderLevel    : String;
        Discontinued    : Boolean;

}
