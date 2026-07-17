import mongoose from "mongoose";
import Room from "../../models/room.model.ts";
import AppError from "../../utils/appError.ts";

export interface CreateRoomRequest {
  roomNumber: string;
  roomType: string;
  rent: number;
  apartmentId: string;
}

export interface SafeRoom {
  roomId: mongoose.Types.ObjectId;
  roomNumber: string;
  roomType: string;
  rent: number;
  apartmentId: mongoose.Types.ObjectId;
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

  return {
    message: "Rooms Fetched Successfully",
    rooms: rooms.map((room) => ({
      roomId: room._id,
      roomNumber: room.roomNumber,
      roomType: room.roomType,
      rent: room.rent,
      apartmentId: room.apartmentId,
    })),
  };
};
