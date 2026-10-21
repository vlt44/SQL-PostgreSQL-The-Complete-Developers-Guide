const express = require("express");
const UserRepo = require("../repos/users-repo");
const router = express.Router();

router.get("/users", async (req, res) => {
  const users = await UserRepo.find();
  res.send(users);
});

router.get("/users/:id", async (req, res) => {
  const { id } = req.params;

  user = await UserRepo.findById(id);

  if (user) {
    res.send(user);
  } else {
    res.status(404).send({ message: "User not found" });
  }
});

router.post("/users", async (req, res) => {
  const { username, bio } = req.body;

  await UserRepo.insert({ username, bio});

  res.send('')
});

router.put("/users/:id", async (req, res) => {
  const { id } = req.params;
  const { username, bio } = req.body;

  const user = await UserRepo.findById(id, username, bio);

  if (user) {
    res.send(user);
  } else {
    res.status(404);
  }
});

router.delete("/users/:id", async (req, res) => {
  const { id } = req.params;

  const user = await UserRepo.findById(id);

  if (user) {
    res.send(user);
  } else {
    res.status(404);
  }
});

module.exports = router;