import express from "express";
import { connectDatabase } from "./configs/database.ts";
import router from "./routers/routers.ts";
import { globalErrorHandler } from "./middlewares/error.ts";

const app = express();

app.use(express.json());
app.use("/api/v1", router);
app.use(globalErrorHandler);

app.get("/health", (req, res) => {
  res.status(200).json({
    success: true,
    message: "Server is running",
    timestamp: new Date().toISOString(),
  });
});

const startServer = async () => {
  try {
    await connectDatabase();
    app.listen(5005, () => {
      console.log(`🚀 Server running on port ${5005}`);
    });
  } catch (error) {
    console.error("Failed to start server:", error);
    process.exit(1);
  }
};

startServer();
