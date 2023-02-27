sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'productsapp/test/integration/FirstJourney',
		'productsapp/test/integration/pages/ProductSetList',
		'productsapp/test/integration/pages/ProductSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductSetList, ProductSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('productsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductSetList: ProductSetList,
					onTheProductSetObjectPage: ProductSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);