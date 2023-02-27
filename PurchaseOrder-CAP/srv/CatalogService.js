const cds = require('@sap/cds')
module.exports = function () {
    const { EmployeeSet, POs } = this.entities;

    this.on("Boost", async (req, res) => {
        // console.log("Boost is called");
        // console.log(req.params);
        // var Id = req.params[0];
        // var wherecondition = "ID ='" + Id + "'";

        // const tx = cds.tx(req);
        // var a = await tx.run(SELECT.from(POs).where(wherecondition));
        // console.log(a);
        // console.log("---------------------------------------------------------");
        // console.log("---------------------------------------------------------");

        // const b = await tx.run(UPDATE(POs).with({
        //     GROSS_AMOUNT: {'+=': 20000},
        //     NOTE: 'Jai Shree Ram'
        // }
        // ).where(wherecondition))


        var c = await tx.update(POs).with({
            GROSS_AMOUNT: { '+=': 20000 },
            NOTE: 'Jai Shree Ram!! Raja Ram'
        }).where(wherecondition);

        console.log(c);
    });


    this.on("largestPO", async (req, res) => {
        var ret = [];
        ret.push({ID: "Adwait"});
        return ret;
    })



}