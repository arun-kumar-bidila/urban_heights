import type { Request, Response } from "express";
import Admin from "../../models/admin.model.ts";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import type { AdminRequest } from "../../middlewares/admin.middleware.ts";

export const registerAdminController = async (req: Request, res: Response) => {
  try {
    const { name, email, password } = req.body as {
      name: string;
      email: string;
      password: string;
    };

    const isExistingUser = await Admin.findOne({ email });
    if (isExistingUser) {
      return res.json(400).json({ message: "Admin Already Exists" });
    }

    const hashPassword = await bcrypt.hash(password, 10);

    const admin = await Admin.create({
      name,
      email,
      password: hashPassword,
    });

    return res.status(201).json({ message: "Admin Created Successfully" });
  } catch (error) {
    return res.status(500).json({ message: "Admin Registration Failed" });
  }
};

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
        adminId: String(admin._id),
      },
      "secretKey",
    );

    return res.status(200).json({ message: "Admin Login Successful", token });
  } catch (error) {
    return res.status(500).json({ message: "Admin Login Failed" });
  }
};

export const profileAdminController = async (
  req: AdminRequest,
  res: Response,
) => {
  try {
    const adminId = req.adminId;

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
