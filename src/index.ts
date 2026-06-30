import "dotenv/config";
import prisma from "./lib/client.js";
import express from "express";
const app = express();

app.get("/", async (req, res) => {
  const user = await prisma.user.findMany();
  res.json({
    message: user,
  });
});
app.post("/", async (req, res) => {
  const user = await prisma.user.create({
    data: {
      name: "aman",
      password: "hello23456",
    },
  });
  res.json({
    message: "post endpoint",
  });
});
app.listen(3000, () => console.log("server running"));
