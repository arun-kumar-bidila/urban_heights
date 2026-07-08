import Apartment from "../../models/apartment.model.ts";
import bcrypt from "bcrypt";

export interface CreateApartmentRequest {
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
  password: string;
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
  await Apartment.create({
    apartmentId: "1",
    apartmentName,
    address,
    ownerName,
    ownerMobile,
    password: hashedPassword,
  });

  return {
    message: "Apartment Created Successfully",
    apartmentId: "1",
  };
};
