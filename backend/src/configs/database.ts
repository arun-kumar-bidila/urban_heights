import mongoose from "mongoose";

export const connectDatabase = async (): Promise<void> => {
  try {
    const mongoUri =
      "mongodb+srv://bidilaarun_db_user:arun5452@cluster0.jzkkuix.mongodb.net/";

    await mongoose.connect(mongoUri);
    console.log("✅ MongoDB Connected Successfully");
    console.log(`📊 Database: ${mongoose.connection.name}`);
  } catch (error) {
    console.error("❌ MongoDB Connection Error:", error);
    process.exit(1);
  }
};

mongoose.connection.on("disconnected", () => {
  console.log("⚠️  MongoDB Disconnected");
});

mongoose.connection.on("error", (error) => {
  console.error("❌ MongoDB Error:", error);
});
