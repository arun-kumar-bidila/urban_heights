import Room from "../../models/room.model.ts";
import Tenant from "../../models/tenant.model.ts";
import AppError from "../../utils/appError.ts";

export interface CreateTenantRequest {
  fullName: string;
  mobile: string;
  email: string;
  roomId: string;
  apartmentId: string;
}

export const createTenant = async ({
  fullName,
  mobile,
  email,
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
    roomId,
    apartmentId,
  });

  return {
    message: "Tenant Created Successfully",
  };
};
