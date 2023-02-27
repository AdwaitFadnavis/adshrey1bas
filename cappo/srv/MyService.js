const cds = require("@sap/cds");
const { employees } = cds.entities("anubhav.db.master");

const mysrvdemo = function (srv) {

    srv.on("READ", "ReadEmoloyeeSet", async (req, res) => {
        //hardcoded data
        // var results = [];
        // obj = {
        //     "ID": 123,
        //     "Name": "Adwait",
        //     "nameFirst": "Adwait",
        //     "nameLast": "nameLast"
        // }
        // results.push(obj);
        // return results;

        //first 10 employees

        // const tx = cds.tx(req);
        // return tx.run(SELECT.from(employees).limit(10));


        //where condition
        const tx = cds.tx(req);
        //where condtion is kept in tilt symbol here
        return tx.run(SELECT.from(employees).where`salaryAmount >= 90000`);

    }),

        srv.on("CREATE", "InsertEmoloyeeSet", async (req, res) => {
            console.log("me alo")
            console.log(req.data);
            const tx = cds.tx(req);
            await tx.run(INSERT.into(employees).entries(req.data));
        }),


        srv.on("UPDATE", "UpdateEmoloyeeSet", async (req, res) => {
            const tx = cds.tx(req);
            await tx.run(UPDATE(employees).set`nameFirst = 'Adwait'`.where`ID='02BD2137-0890-1EEA-A6C2-BB55C19847FF'`)
        }),

        srv.on("DELETE", "DeleteEmoloyeeSet", async (req, res) => {
            const tx = cds.tx(req);
            await tx.run(DELETE(employees).where`ID='02BD2137-0890-1EEA-A6C2-BB55C19847FF'`)
            await tx.run(SELECT.from(employees).where`ID='02BD2137-0890-1EEA-A6C2-BB55C19847FF'`);
        })
}

module.exports = mysrvdemo;