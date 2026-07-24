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

export interface ChangeRoomRequest {
  tenantId: string;
  currentRoomId: string;
  newRoomId: string;
  newRoomType: string;
  newRoomNumber: string;
  apartmentId: string;
}

export interface RemoveTenantRequest {
  tenantId: string;
  apartmentId: string;
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

export const changeRoom = async ({
  tenantId,
  currentRoomId,
  newRoomId,
  newRoomType,
  newRoomNumber,
  apartmentId,
}: ChangeRoomRequest): Promise<{ message: string }> => {
  const tenant = await Tenant.findOne({
    _id: tenantId,
    apartmentId,
  });

  if (!tenant) {
    throw new AppError("Tenant not found", 404);
  }

  const currentRoom = await Room.findOne({
    _id: currentRoomId,
    apartmentId,
  });

  if (!currentRoom) {
    throw new AppError("Current room not found", 404);
  }

  const newRoom = await Room.findOne({
    _id: newRoomId,
    apartmentId,
  });

  if (!newRoom) {
    throw new AppError("New room not found", 404);
  }

  if (!newRoom.vacant) {
    throw new AppError("New room is already occupied", 400);
  }

  await Tenant.findByIdAndUpdate(
    tenantId,
    {
      roomId: newRoomId,
      roomNumber: newRoomNumber,
      roomType: newRoomType,
    },
    { new: true },
  );

  await Room.findByIdAndUpdate(currentRoomId, {
    vacant: true,
  });

  await Room.findByIdAndUpdate(newRoomId, {
    vacant: false,
  });

  return {
    message: "Room changed successfully",
  };
};

export const removeTenant = async ({
  tenantId,
  apartmentId,
}: RemoveTenantRequest): Promise<{ message: string }> => {
  const tenant = await Tenant.findOne({
    _id: tenantId,
    apartmentId,
  });

  if (!tenant) {
    throw new AppError("Tenant not found", 404);
  }

  const currentRoomId = tenant.roomId;

  if (currentRoomId) {
    const room = await Room.findOneAndUpdate(
      {
        _id: currentRoomId,
        apartmentId,
      },
      {
        vacant: true,
      },
      {
        new: true,
      },
    );

    if (!room) {
      throw new AppError("Room not found", 404);
    }
  }

  await Tenant.findByIdAndUpdate(tenantId, {
    roomId: null,
    roomNumber: null,
    roomType: null,
    apartmentId: null,
    apartmentName: null,
  });

  return {
    message: "Tenant removed successfully",
  };
};
