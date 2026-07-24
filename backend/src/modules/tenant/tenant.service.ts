import Room from "../../models/room.model.ts";
import Tenant from "../../models/tenant.model.ts";
import AppError from "../../utils/appError.ts";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

export interface CreateTenantRequest {
  fullName: string;
  mobile: string;
  email: string;

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
  roomNumber,
  roomType,
  apartmentName,
  roomId,
  apartmentId,
}: CreateTenantRequest): Promise<{ message: string }> => {
  const room = await Room.findOne({
    _id: roomId,
    apartmentId,
  });

  if (!room) {
    throw new AppError("Room not found", 404);
  }

  if (!room.vacant) {
    throw new AppError("Tenant found in this room", 400);
  }

  const existingTenant = await Tenant.findOne({
    mobile,
  });

  if (existingTenant) {
    if (existingTenant.roomId == null && existingTenant.apartmentId == null) {
      await Tenant.findByIdAndUpdate(
        existingTenant._id,
        {
          roomId,
          roomNumber,
          roomType,
          apartmentName,
          apartmentId,
        },
        {
          new: true,
        },
      );

      await Room.findByIdAndUpdate(roomId, {
        vacant: false,
      });

      return {
        message: "Tenant assigned to room successfully",
      };
    }

    throw new AppError("Tenant is already in another room", 400);
  }

  const password = mobile.slice(-6);

  const hashedPassword = await bcrypt.hash(password, 10);

  await Tenant.create({
    fullName,
    mobile,
    email,
    password: hashedPassword,
    roomNumber,
    roomType,
    apartmentName,
    roomId,
    apartmentId,
  });

  await Room.findByIdAndUpdate(roomId, {
    vacant: false,
  });

  return {
    message: "Tenant created successfully",
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
