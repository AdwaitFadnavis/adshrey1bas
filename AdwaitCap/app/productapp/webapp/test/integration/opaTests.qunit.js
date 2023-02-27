sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/adwait/productapp/test/integration/FirstJourney',
		'com/adwait/productapp/test/integration/pages/ProductSetList',
		'com/adwait/productapp/test/integration/pages/ProductSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductSetList, ProductSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/adwait/productapp') + '/index.html'
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