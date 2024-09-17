const express = require("express");
const path = require("path");
const session = require('express-session');

const app = express();
//set "public" folder to be static folder, user can access it directly
app.use("/public", express.static(path.join(__dirname, "public")));

// for json exchange
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// for session
app.use(session({
    cookie: { maxAge: 24*60*60*1000 },  //1 day in millisec
    secret: 'mysecretcode',
    resave: false,
    saveUninitialized: true
}));

// ============= Other routes ==============
// ------------- Login --------------
app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;
    if(username == "admin" && password == "1111") {
        // keep username and userID in session
        req.session.userID = 101;
        req.session.username = username;
        res.send("/welcome");
    }
    else if(username == "user" && password == "2222") {
        // keep username and userID in session
        req.session.userID = 102;
        req.session.username = username;
        res.send("/welcome");
    }
    else {
        res.status(401).send("Login failed");
    }
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

// ------------- Get username --------------
app.get("/user", function(req, res) {
    if(req.session.username) {
        res.json({userID: req.session.userID, username: req.session.username});
    }
    else {
        res.status(401).send("No user info");
    }
})

// ============= Pages ==============
// ------------- Welcome page --------------
app.get("/welcome", function (req, res) {
    if(req.session.username) {
        res.sendFile(path.join(__dirname, "yyy.html"));
    }
    else {
        res.redirect("/");
    }
});

// ============= Root ==============
app.get("/", function (req, res) {
    // already login?
    if(req.session.username) {
        res.redirect("/welcome");
    }
    else {
        res.sendFile(path.join(__dirname, "xxx.html"));
    }    
});

const port = 3000;
app.listen(port, function () {
    console.log("Server is ready at " + port);
});