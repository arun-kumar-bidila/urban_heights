import Admin from "../../models/admin.model.ts";
import AppError from "../../utils/appError.ts";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export interface RegisterAdminRequest {
  name: string;
  email: string;
  password: string;
}

export interface LoginAdminRequest {
  email: string;
  password: string;
}

export interface SafeUser {
  name: string;
  email: string;
}

export const registerAdmin = async ({
  name,
  email,
  password,
}: RegisterAdminRequest): Promise<{ message: string }> => {
  const isExistingUser = await Admin.findOne({ email });
  if (isExistingUser) {
    throw new AppError("Admin Already Exists", 400);
  }

  const hashPassword = await bcrypt.hash(password, 10);

  const admin = await Admin.create({
    name,
    email,
    password: hashPassword,
  });

  return {
    message: "Admin account Created",
  };
};

export const loginAdmin = async ({
  email,
  password,
}: LoginAdminRequest): Promise<{ message: string; token: string }> => {
  const admin = await Admin.findOne({ email });

  if (!admin) {
    throw new AppError("Admin doesn't exist", 400);
  }

  const isMatch = await bcrypt.compare(password, admin.password);

  if (!isMatch) {
    throw new AppError("Incorrect User Details", 400);
  }

  const token = jwt.sign(
    {
      userId: String(admin._id),
    },
    "secretKey",
  );

  return {
    message: "Admin Login Successful",
    token: token,
  };
};

export const fetchProfile = async (
  userId: string,
): Promise<{ message: string; admin: SafeUser }> => {
  const admin = await Admin.findById(userId);

  if (!admin) {
    throw new AppError("Admin Doesn't Exist", 400);
  }

  return {
    message: "Admin Profile Fetched Successfully",
    admin: admin,
  };
};
