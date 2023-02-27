//Skeleton for implimenting custom and generic handellers in cap
module.exports = cds.service.impl(async function () {

    ///step1 - get entityset

    const { EmployeesSet, POs } = this.entities;

    //step2 - define generic handellers for validation...this can be extended with 
    // other entityset for before, on and After operations
    this.before('UPDATE', 'EmployeesSet', (req, res) => {
        //validation logic
        console.log('aa gya');
        var vSal = parseFloat(req.data.salaryAmount);
        if (vSal >= 100000.00) {
            req.error(500, "Salary must be less that 100000");
        }
    })

    //implimenting boost action on a po, for actions we do not mention type of request
    // in the handeller
    this.on('boost', async (req, res) => {
        console.log(req.params);
        var vNodeKey = req.data.NODE_KEY
        const tx = cds.tx(req);
        await tx.update(POs).with({
            GROSS_AMOUNT: { '+=': 2000 },
            NOTE: 'BOOSTED'
        }).where(req.params[0])
    })

    //implimenting custom function to get largest PO
    this.on('largestOrder', async (req, res) => {
        //-----This is working code -----------------//
        // console.log('aa gya');
        // try {
        //     var ID = req.data;
        //     console.log(ID);
        //     const tx = cds.tx(req);
        //     const reply = await tx.read(POs).orderBy({
        //         GROSS_AMOUNT: 'desc'
        //     }).limit(2);
        //     return reply;
        // } catch (error) {
        //     req.error(500, "could not execute the request");
        // }
        //-----This is working code -----------------//

        //this is another way of running query
        const tx = cds.tx(req);
        var reply = tx.run(SELECT.from(POs).orderBy({
            GROSS_AMOUNT: 'desc'
        }).limit(1));
        return reply;
    })

})