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

// for session
app.use(session({
    cookie: { maxAge: 24 * 60 * 60 * 1000 },  //1 day in millisec
    secret: 'mysecretcode',
    resave: false,
    saveUninitialized: true,
    store: new MemoryStore({
        checkPeriod: 24 * 60 * 60 * 1000 // prune expired entries every 24h
    })
}));

//delete


app.delete("/decourse/:id", function (req, res) {
    const id = req.params.id;
    const sql = "DELETE FROM course WHERE course_ID = ?";
    con.query(sql, [id], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.affectedRows != 1) {
            console.error('Row deleted is not 1');
            return res.status(500).send("Delete failed");
        }
        res.send("Delete succesfully");
    });
});



// ------------- Delete a product --------------
app.delete("/del", function (req, res) {
    const id = req.params.id;
    const sql = "DELETE FROM course WHERE course_ID = ?";
    con.query(sql, [id], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.affectedRows != 1) {
            console.error('Row deleted is not 1');
            return res.status(500).send("Delete failed");
        }
        res.send("Delete succesfully");
    });
});


// ------------- Login --------------
app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const sql = "SELECT id, password FROM student WHERE username = ? ";
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
                res.send("/homepage");
            }
            else {
                //wrong password
                res.status(400).send("Wrong password");
            }
        });

    });
});

app.post("/loginteacher", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    const sql = "SELECT TID,FnameT, password FROM teacher WHERE username = ? ";
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
                req.session.teacherID = results[0].TID;
                req.session.teachername = results[0].FnameT;
                res.send("/teacher");
            }
            else {
                //wrong password
                res.status(400).send("Wrong password");
            }
        });

    });
});

// ------------- Get username --------------
app.get("/user", function (req, res) {
    const sql = "SELECT * FROM student WHERE ID =  ?";
    con.query(sql, [req.session.userID], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });

})

app.get("/userteach", function (req, res) {
    console.log(req.session.teachername);
    const sql = "SELECT * FROM teacher WHERE TID =  ?";
    con.query(sql, [req.session.teacherID], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });

})








app.post("/showclass", function (req, res) {
    const name = req.session.teachername;
    const subject = req.body.subject;
    const grade = req.body.grade;
    const sql = "SELECT course.lesson_name,course.grade , lesson.lessonname FROM course INNER JOIN lesson ON course.lesson_name=lesson.lessonname WHERE course.FnameT = ? AND course.lesson_name = ?";
    con.query(sql, [name, subject], function (err, results) {

        req.session.s =  results[0].lesson_name; 
        req.session.g =  results[0].grade;  

        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
       if(grade != results[0].grade){
        res.send("/teacher");
       }
       
       else{if (subject == 'Alphabet'  ) {
            res.send("/showal");
        }
        else if (subject == 'Color' ) {
            res.send("/showc");
        }
        else if (subject == 'Number' )  {
            res.send("/shown");
        }
        else if (subject == 'Animal' ) {
            res.send("/showa");
        }
        else if (subject == 'Fruit' ) {
            res.send("/showf");
        }}
       

        
        
           
        
        
       
       
    });

})
 app.get("/showclassl", function (req, res) {
            const name = req.session.teachername;
            const s = req.session.s;
            const g = req.session.g;
            console.log(s+g+name)
            const sql = "SELECT course.course_ID, course.lesson_name,student.StudentID , student.FnameS, student.Alscore, student.Ascore,student.Fscore,student.Nscore,student.Cscore ,student.LnameS FROM course INNER JOIN student ON course.grade=student.grade WHERE course.FnameT =  ? AND course.lesson_name =  ? AND course.grade=  ? ";
            con.query(sql, [name, s, g], function (err, results) {
                if (err) {
                    console.error(err);
                    return res.status(500).send("Database server error");
                }
                res.json(results);
            });
        })

 app.put("/scoreAnimal", function (req, res) {
            const id= req.session.userID 
            // console.log(id);
            // res.end();
            const score = req.body.score;
            const sql = "UPDATE student SET Ascore =? WHERE ID = ?";
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

app.put("/tel", function (req, res) {
    const tname= req.session.teachername
    // console.log(id);
    // res.end();
    const tel = req.body.tel;
    const sql = "UPDATE teacher SET Tel =? WHERE FnameT = ?";
    con.query(sql, [tel, tname], function (err, results) {
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


app.put("/scoreFruit", function (req, res) {
    const id= req.session.userID 
    // console.log(id);
    // res.end();
    const scoref = req.body.scoref;
    const sql = "UPDATE student SET Fscore =? WHERE ID = ?";
    con.query(sql, [scoref, id], function (err, results) {
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

app.put("/scoreColor", function (req, res) {
    const id= req.session.userID 
    // console.log(id);
    // res.end();
    const scorec = req.body.scorec;
    const sql = "UPDATE student SET Cscore =? WHERE ID = ?";
    con.query(sql, [scorec, id], function (err, results) {
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

app.put("/scoreNumber", function (req, res) {
    const id= req.session.userID 
    // console.log(id);
    // res.end();
    const scoren = req.body.scoren;
    const sql = "UPDATE student SET Nscore =? WHERE ID = ?";
    con.query(sql, [scoren, id], function (err, results) {
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

app.put("/scoreAlphabet", function (req, res) {
    const id= req.session.userID 
    // console.log(id);
    // res.end();
    const scorea = req.body.scorea;
    const sql = "UPDATE student SET Alscore =? WHERE ID = ?";
    con.query(sql, [scorea, id], function (err, results) {
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

app.get("/showsubject", function (req, res) {
    const name = req.session.teachername;
    const sql = "SELECT * FROM course WHERE FnameT = ? ORDER BY lesson_name ASC";
    con.query(sql, [name], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });

})







//--------show detail------
app.get("/showsub", function (_req, res) {
    const sql = "SELECT * FROM course";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

// regis
app.put("/regis", function (req, res) {
    // const {name, price, amount} = req.body;
    // const newProduct = {name: name, price: price, amount: amount};
    const fname = req.body.fname;
    const lname = req.body.lname;
    const sid = req.body.sid;
    const user = req.body.user;
    const pass = req.body.pass;
    const grade = req.body.grade;
    const saltRounds = 10;
    bcrypt.hash(pass, saltRounds, function (err, hash) {
        if (err) {
            return res.status(500).send("Hashing error");
        }
        const sql = "INSERT INTO student (FnameS,LnameS,StudentID,username,password,grade)VALUES ( ?, ?, ?, ?, ?, ?) ;";
        con.query(sql, [fname, lname, sid, user, hash, grade], function (err, results) {
            if (err) {
                console.error(err);
                return res.status(500).send("Database server error");
            }
            if (results.affectedRows != 1) {
                console.error('Row added is not 1');
                return res.status(500).send("Add failed");
            }
            res.send("/");
        });
    })
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
                req.session.adminID = results[0].id;
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

//add class
app.put("/addclass", function (req, res) {
    const lessonname = req.body.lessonname;
    const teachername = req.body.teachername;
    const grade = req.body.grade;
    const sql = "INSERT INTO course (lesson_name,FnameT,grade)VALUES ( ?, ?,?) ;";
    con.query(sql, [lessonname, teachername, grade], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.affectedRows != 1) {
            console.error('Row updated is not 1');
            return res.status(500).send("Update failed");
        }
        res.send("/adminhomepage");
    });
});

//get lesson
app.get("/sub", function (_req, res) {
    const sql = "SELECT * FROM lesson";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

//get teacher
app.get("/teach", function (_req, res) {
    const sql = "SELECT * FROM teacher";
    con.query(sql, function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
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

//------------regis-------
app.get("/regis", function (_req, res) {
    res.sendFile(path.join(__dirname, "register.html"));
});

app.get("/adminhomepage", function (req, res) {
    console.log(req.session.adminID);
    res.sendFile(path.join(__dirname, "adminhome.html"));
});



app.get("/admin", function (_req, res) {
    res.sendFile(path.join(__dirname, "adminlog.html"));
});

app.get("/showal", function (_req, res) {
    res.sendFile(path.join(__dirname, "showAl.html"));
});
app.get("/showa", function (_req, res) {
    res.sendFile(path.join(__dirname, "showA.html"));
});
app.get("/showc", function (_req, res) {
    res.sendFile(path.join(__dirname, "showC.html"));
});
app.get("/shown", function (_req, res) {
    res.sendFile(path.join(__dirname, "showN.html"));
});

app.get("/showf", function (_req, res) {
    res.sendFile(path.join(__dirname, "showF.html"));
});

app.get("/testfruit", function (req, res) {
    console.log(req.session.userID);
    res.sendFile(path.join(__dirname, "fruittest.html"));
});
app.get("/homepage", function (req, res) {
    console.log(req.session.userID);
    res.sendFile(path.join(__dirname, "homepage.html"));
});
app.get("/teachlog", function (_req, res) {
    res.sendFile(path.join(__dirname, "teacherlog.html"));
});

app.get("/teacher", function (req, res) {
    console.log(req.session.teacherID);
    res.sendFile(path.join(__dirname, "teacher.html"));
});
app.get("/", function (req, res) {
    console.log(req.session.userID);
    res.sendFile(path.join(__dirname, "login.html"));
});

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
app.get("/lesson2f", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2f.html"));
});
app.get("/lesson1an", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson1an.html"));
});
app.get("/lesson2an", function (_req, res) {
    res.sendFile(path.join(__dirname, "lesson2an.html"));
});

app.get("/forgotpass", function (_req, res) {
    res.sendFile(path.join(__dirname, "forgotpass.html"));
});

const port = 3000;
app.listen(port, function () {
    console.log("Server is ready at " + port);
});
