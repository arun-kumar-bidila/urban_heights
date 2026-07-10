import Apartment from "../../models/apartment.model.ts";
import bcrypt from "bcrypt";
import AppError from "../../utils/appError.ts";
import jwt from "jsonwebtoken";
import { generateApartmentCode } from "../../utils/generateApartementCode.ts";
import { generateOwnerCode } from "../../utils/generateOwnerCode.ts";
import Owner from "../../models/owner.model.ts";

export interface CreateApartmentRequest {
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
  ownerCode: string;
  password: string;
}

export interface LoginApartmentRequest {
  apartmentId: string;
  password: string;
}

export interface SafeApartment {
  apartmentCode: string;
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
  ownerCode: string;
}
export const createApartment = async ({
  apartmentName,
  address,
  ownerName,
  ownerMobile,
  ownerCode,
  password,
}: CreateApartmentRequest): Promise<{
  message: string;
  apartmentCode: string;
  ownerCode: string;
}> => {
  const hashedPassword = await bcrypt.hash(password, 10);
  const generatedId = generateApartmentCode();
  if (!ownerCode || ownerCode.length == 0) {
    ownerCode = generateOwnerCode();
  }

  const owner = await Owner.create({
    ownerName,
    ownerMobile,
    ownerCode,
  });

  if (!owner) {
    throw new AppError("Owner Creation Failed", 400);
  }

  const response = await Apartment.create({
    apartmentCode: generatedId,
    apartmentName,
    address,
    ownerName,
    ownerMobile,
    ownerCode,
    password: hashedPassword,
  });

  return {
    message: "Apartment Created Successfully",
    apartmentCode: response.apartmentCode,
    ownerCode: response.ownerCode,
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

export const fetchSummary = async (): Promise<{
  message: string;
  totalApartments: number;
  totalOwners: number;
}> => {
  const totalApartments = await Apartment.find({});
  const totalOwners = await Owner.find({});

  return {
    message: "Summary",
    totalApartments: totalApartments.length,
    totalOwners: totalOwners.length,
  };
};

export const allApartments = async (): Promise<{
  message: string;
  apartments: SafeApartment[];
}> => {
  const apartments = await Apartment.find({});

  return {
    message: "Apartments Fetched Successfully",
    apartments: apartments,
  };
};
