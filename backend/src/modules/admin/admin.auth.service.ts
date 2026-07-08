import Admin from "../../models/admin.model.ts";
import AppError from "../../utils/appError.ts";
import bcrypt from "bcrypt";

export interface registerAdminRequest {
  name: string;
  email: string;
  password: string;
}

export const registerAdmin = async ({
  name,
  email,
  password,
}: registerAdminRequest): Promise<{ message: string }> => {
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
