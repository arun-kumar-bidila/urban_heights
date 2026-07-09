import Apartment from "../../models/apartment.model.ts";
import bcrypt from "bcrypt";
import AppError from "../../utils/appError.ts";
import jwt from "jsonwebtoken";
import { generateApartmentId } from "../../utils/generateApartementId.ts";

export interface CreateApartmentRequest {
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
  password: string;
}

export interface LoginApartmentRequest {
  apartmentId: string;
  password: string;
}

export interface SafeApartment {
  apartmentId: string;
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
}
export const createApartment = async ({
  apartmentName,
  address,
  ownerName,
  ownerMobile,
  password,
}: CreateApartmentRequest): Promise<{
  message: string;
  apartmentId: string;
}> => {
  const hashedPassword = await bcrypt.hash(password, 10);
  const generatedId = generateApartmentId();
  const response = await Apartment.create({
    apartmentId: generatedId,
    apartmentName,
    address,
    ownerName,
    ownerMobile,
    password: hashedPassword,
  });

  return {
    message: "Apartment Created Successfully",
    apartmentId: response.apartmentId,
  };
};

export const loginApartment = async ({
  apartmentId,
  password,
}: LoginApartmentRequest): Promise<{ message: string; token: string }> => {
  const apartment = await Apartment.findOne({ apartmentId });

  if (!apartment) {
    throw new AppError("Apartment doesn't exist", 400);
  }

  const isMatch = bcrypt.compare(password, apartment.password);
  if (!isMatch) {
    throw new AppError("Invalid Apartment Credentials", 400);
  }
  const token = jwt.sign({ userId: apartment._id }, "secretKey");

  return {
    message: "Apartment Login Success",
    token: token,
  };
};

export const fetchApartment = async (
  userId: string,
): Promise<{ message: string; apartment: SafeApartment }> => {
  const apartment = await Apartment.findById(userId);
  if (!apartment) {
    throw new AppError("Apartment Doesn't exist", 400);
  }
  return {
    message: "Apartment fetch success",
    apartment: apartment,
  };
};
