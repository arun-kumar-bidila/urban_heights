import type { Request, Response } from "express";
import Admin from "../../models/admin.model.ts";
import bcrypt from "bcrypt";

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
