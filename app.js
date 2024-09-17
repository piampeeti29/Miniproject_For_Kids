const express = require("express");
const path = require("path");
// database connection
const session = require('express-session');
const MemoryStore = require('memorystore')(session);
const con = require("./config/db");
const bcrypt = require("bcrypt");
const app = express();
//set "public" folder to be static folder, user can access it directly
app.use(express.static(path.join(__dirname, "/")));

// for json exchange
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ============= Pages ==============


// for session
app.use(session({
    cookie: { maxAge: 24*60*60*1000 },  //1 day in millisec
    secret: 'mysecretcode',
    resave: false,
    saveUninitialized: true,
    store: new MemoryStore({
        checkPeriod: 24 * 60 * 60 * 1000 // prune expired entries every 24h
    })
}));

// ============= Other routes ==============
// ------------- Login --------------
app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const sql = "SELECT id, password, role FROM user WHERE username = ? ";
    con.query(sql, [username], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.length != 1) {
            return res.status(400).send("Wrong username");
        }

        bcrypt.compare(password, results[0].password, function (err, same) {
            if (err) {
                res.status(503).send("Authentication server error");
            }
            else if (same == true) {
                //correct login send destination URL to client
                req.session.userID = results[0].id;
                res.send("/testfruit");
            }
            else {
                //wrong password
                res.status(400).send("Wrong password");
            }
        });

    });  
});

// add course

app.post("/addcourse", function (req, res) {
    // const {name, price, amount} = req.body;
    // const newProduct = {name: name, price: price, amount: amount};
    const cname = req.body.cname;
    const tid = req.body.tid;
    const sql = "INSERT INTO course (CourseName,TeacherID)VALUES ( ?, ?) ;";
    con.query(sql,[cname,tid], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.affectedRows != 1) {
            console.error('Row added is not 1');
            return res.status(500).send("Add failed");
        }
        res.send("Add succesfully");
    });
});

// ----------delete-----------




// ------------- Update a product --------------
app.put("/score", function (req, res) {
    const id= req.session.userID 
    // console.log(id);
    // res.end();
    const score = req.body.score;
    const sql = "UPDATE user SET score =? WHERE id = ?";
    con.query(sql, [score, id], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.affectedRows != 1) {
            console.error('Row updated is not 1');
            return res.status(500).send("Update failed");
        }
        res.send("Update succesfully");
    });
});


// ------------- Logout --------------
app.get("/logout", function (req, res) {
    //clear session variable
    req.session.destroy(function (err) {
        if (err) {
            console.error(err.message);
            res.status(500).send("Cannot clear session");
        }
        else {
            res.send("/");
        }        
    });
});




//admin log in
app.post("/loginadmin", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    // console.log(username, password);

    const sql = "SELECT id, password, role FROM useradmin WHERE username = ? ";
    con.query(sql, [username], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.length != 1) {
            return res.status(400).send("Wrong username");
        }

        bcrypt.compare(password, results[0].password, function (err, same) {
            if (err) {
                res.status(503).send("Authentication server error");
            }
            else if (same == true) {
                //correct login send destination URL to client
                res.send("/adminhomepage");
            }
            else {
                //wrong password
                res.status(400).send("Wrong password");
            }
        });


    });
});


// ------------- Welcome --------------
app.get("/homepage", function (req, res) {

    res.sendFile(path.join(__dirname, "homepage.html"));
});

app.get("/adminhomepage", function (req, res) {
    res.sendFile(path.join(__dirname, "adminhome.html"));
});

app.get("/admin", function (req, res) {
    res.sendFile(path.join(__dirname, "adminlog.html"));
});

// ============= Create hashed password ==============
app.get("/password/:pass", function (req, res) {
    const password = req.params.pass;
    const saltRounds = 10;    //the cost of encrypting see https://github.com/kelektiv/node.bcrypt.js#a-note-on-rounds
    bcrypt.hash(password, saltRounds, function (err, hash) {
        if (err) {
            return res.status(500).send("Hashing error");
        }
        //return hashed password, 60 characters
        // console.log(hash.length);
        res.send(hash);
    });
});





app.get("/testalpha", function (req, res) {
  
    const sql = "SELECT * FROM alphatest";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

app.get("/testnum", function (req, res) {
    const sql = "SELECT * FROM numbertest";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

app.get("/testcol", function (_req, res) {
    const sql = "SELECT * FROM colortest";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});



app.get("/testani", function (_req, res) {
    const sql = "SELECT * FROM animaltest";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/testfrui", function (_req, res) {
    const sql = "SELECT * FROM fruittest";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});



app.get("/course", function (_req, res) {
    const sql = "SELECT * FROM course";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});









// alphabet
app.get("/lessonalphaone", function (_req, res) {
    const sql = "SELECT * FROM alphaone";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

app.get("/lessonalphatwo", function (_req, res) {
    const sql = "SELECT * FROM alphatwo";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

app.get("/lessonalphathree", function (_req, res) {
    const sql = "SELECT * FROM alphathree";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});


app.get("/lessoncolorone", function (_req, res) {
    const sql = "SELECT * FROM colorone";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

app.get("/lessoncolortwo", function (_req, res) {
    const sql = "SELECT * FROM colortwo";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
 
app.get("/lessoncolorthree", function (_req, res) {
    const sql = "SELECT * FROM colorthree";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonnumberone", function (_req, res) {
    const sql = "SELECT * FROM numberone";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonnumbertwo", function (_req, res) {
    const sql = "SELECT * FROM numbertwo";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonnumberthree", function (_req, res) {
    const sql = "SELECT * FROM numberthree";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonnumberfour", function (_req, res) {
    const sql = "SELECT * FROM numberfour";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonnumberfive", function (_req, res) {
    const sql = "SELECT * FROM numberfive";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonfruitone", function (_req, res) {
    const sql = "SELECT * FROM fruitlesson1";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonfruittwo", function (_req, res) {
    const sql = "SELECT * FROM fruitlesson2";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonanimalone", function (_req, res) {
    const sql = "SELECT * FROM animallesson1";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
app.get("/lessonanimaltwo", function (_req, res) {
    const sql = "SELECT * FROM animallesson2";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});
 
 
 
// ============= Root ==============
app.get("/alphabet", function (_req, res) {
    res.sendFile(path.join(__dirname, "alphabet.html"));
});

app.get("/color", function (_req, res) {
    res.sendFile(path.join(__dirname, "color.html"));
});

app.get("/number", function (_req, res) {
    res.sendFile(path.join(__dirname, "number.html"));
});
app.get("/fruit", function (_req, res) {
    res.sendFile(path.join(__dirname, "fruit.html"));
});
app.get("/animal", function (_req, res) {
    res.sendFile(path.join(__dirname, "animal.html"));
});



// ============= Root ==============
app.get("/lesson1", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1.html"));
});
app.get("/lesson2", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2.html"));
});
app.get("/lesson3", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson3.html"));
});
app.get("/lesson1c", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1c.html"));
});
app.get("/lesson2c", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2c.html"));
});
app.get("/lesson3c", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson3c.html"));
});
app.get("/lesson1n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1n.html"));
});
app.get("/lesson2n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2n.html"));
});
app.get("/lesson3n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson3n.html"));
});
app.get("/lesson4n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson4n.html"));
});
app.get("/lesson5n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson5n.html"));
});
app.get("/lesson1f", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1f.html"));
});
app.get("/lesson5n", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2f.html"));
});
app.get("/lesson1an", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1an.html"));
});
app.get("/lesson2an", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2an.html"));
});


app.get("/testalphabet", function (_req, res) {
    res.sendFile(path.join(__dirname, "testalphabet.html"));
});

app.get("/testanimal", function (_req, res) {
    res.sendFile(path.join(__dirname, "animaltest.html"));
});

app.get("/testfruit", function (req, res) {
    console.log(req.session.userID);
    res.sendFile(path.join(__dirname, "fruittest.html"));
});

app.get("/testcolor", function (_req, res) {
    res.sendFile(path.join(__dirname, "colortest.html"));
});

app.get("/testnumber", function (_req, res) {
    res.sendFile(path.join(__dirname, "testnumber.html"));
});

app.get("/", function (req, res) {
    console.log(req.session.userID);
    res.sendFile(path.join(__dirname, "login.html"));
});

const port = 3000;
app.listen(port, function () {
    console.log("Server is ready at " + port);
});
