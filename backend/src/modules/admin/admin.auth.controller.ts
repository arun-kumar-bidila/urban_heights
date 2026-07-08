import type { Request, Response } from "express";
import Admin from "../../models/admin.model.ts";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import { sendResponse } from "../../utils/sendResponse.ts";
import { registerAdmin } from "./admin.auth.service.ts";

export const registerAdminController = catchAsync(
  async (req: Request, res: Response) => {
    const { name, email, password } = req.body;

    const result = await registerAdmin({
      name,
      email,
      password,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
    });
  },
);

export const loginAdminController = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body as {
      email: string;
      password: string;
    };

    const admin = await Admin.findOne({ email });

    if (!admin) {
      return res.status(400).json({ message: "Admin doesn't exist" });
    }

    const isMatch = await bcrypt.compare(password, admin.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Incorrect User Details" });
    }

    const token = jwt.sign(
      {
        userId: String(admin._id),
      },
      "secretKey",
    );

    return res.status(200).json({ message: "Admin Login Successful", token });
  } catch (error) {
    return res.status(500).json({ message: "Admin Login Failed" });
  }
};

export const profileAdminController = async (
  req: AuthRequest,
  res: Response,
) => {
  try {
    const adminId = req.userId;

    const admin = await Admin.findById(adminId);

    if (!admin) {
      return res.status(400).json({ message: "Admin Doesn't Exist" });
    }
    return res
      .status(200)
      .json({ message: "Admin Fetch Success", data: admin });
  } catch (error) {
    return res.status(500).json({ message: "Admin Fetch Failure" });
  }
};
