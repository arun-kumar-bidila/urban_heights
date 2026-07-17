import mongoose from "mongoose";
import Room from "../../models/room.model.ts";
import AppError from "../../utils/appError.ts";
import Tenant from "../../models/tenant.model.ts";

export interface CreateRoomRequest {
  roomNumber: string;
  roomType: string;
  rent: number;
  apartmentId: string;
}

export interface SafeTenant {
  tenantId: mongoose.Types.ObjectId;
  fullName: string;
  mobile: string;
  email: string;
  createdAt: string;
}

export interface SafeRoom {
  roomId: mongoose.Types.ObjectId;
  roomNumber: string;
  roomType: string;
  rent: number;
  rentStatus: boolean;
  vacant: boolean;
  apartmentId: mongoose.Types.ObjectId;
  tenant: SafeTenant | null;
}

export const createRoom = async ({
  roomNumber,
  roomType,
  rent,
  apartmentId,
}: CreateRoomRequest): Promise<{ message: string }> => {
  const isExisting = await Room.findOne({ roomNumber, apartmentId });

  if (isExisting) {
    throw new AppError("Room Number Already Exists", 400);
  }
  const result = await Room.create({
    roomNumber,
    roomType,
    rent,
    apartmentId,
  });

  return {
    message: "Room Created Successfully",
  };
};

export const fetchRooms = async (
  apartmentId: string,
): Promise<{ message: string; rooms: SafeRoom[] }> => {
  const rooms = await Room.find({ apartmentId });

  const roomIds = rooms.map((room) => room._id);

  const tenants = await Tenant.find({
    roomId: { $in: roomIds },
  });
  const tenantMap = new Map(
    tenants.map((tenant) => [tenant.roomId.toString(), tenant]),
  );
  return {
    message: "Rooms Fetched Successfully",
    rooms: rooms.map((room) => {
      const tenant = tenantMap.get(room._id.toString());

      return {
        roomId: room._id,
        roomNumber: room.roomNumber,
        roomType: room.roomType,
        rent: room.rent,
        rentStatus: room.rentStatus,
        apartmentId: room.apartmentId,
        vacant: room.vacant,
        tenant: tenant
          ? {
              tenantId: tenant._id,
              fullName: tenant.fullName,
              mobile: tenant.mobile,
              email: tenant.email,
              createdAt: tenant.createdAt,
            }
          : null,
      };
    }),
  };
};
