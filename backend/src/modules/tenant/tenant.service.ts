import Room from "../../models/room.model.ts";
import Tenant from "../../models/tenant.model.ts";
import AppError from "../../utils/appError.ts";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

export interface CreateTenantRequest {
  fullName: string;
  mobile: string;
  email: string;
  password: string;
  roomNumber: string;
  roomType: string;
  roomId: string;
  apartmentName: string;
  apartmentId: string;
}

export interface LoginTenantRequest {
  email: string;
  password: string;
}

export const createTenant = async ({
  fullName,
  mobile,
  email,
  password,
  roomNumber,
  roomType,
  apartmentName,
  roomId,
  apartmentId,
}: CreateTenantRequest): Promise<{ message: string }> => {
  const isExisting = await Tenant.findOne({ roomId });

  if (isExisting) {
    throw new AppError("Tenant Already Exists in this Room", 400);
  }

  const room = await Room.findByIdAndUpdate(
    roomId,
    { vacant: false },
    { new: true },
  );

  if (!room) {
    throw new AppError("Room Id doesn't exist", 400);
  }
  const response = await Tenant.create({
    fullName,
    mobile,
    email,
    password,
    roomNumber,
    roomType,
    apartmentName,
    roomId,
    apartmentId,
  });

  return {
    message: "Tenant Created Successfully",
  };
};

export const loginTenant = async ({
  email,
  password,
}: LoginTenantRequest): Promise<{ message: string; token: string }> => {
  const tenant = await Tenant.findOne({ email });

  if (!tenant) {
    throw new AppError("Email doesn't exist", 400);
  }

  const isMatch = await bcrypt.compare(password, tenant.password);

  if (!isMatch) {
    throw new AppError("Invalid Credentials", 400);
  }

  const token = jwt.sign({ userId: tenant._id }, "secretKey");

  return {
    message: "Tenant login successful",
    token: token,
  };
};
