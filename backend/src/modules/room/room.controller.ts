import type { AuthRequest } from "../../middlewares/auth.middleware.ts";

import type { Response } from "express";
import { catchAsync } from "../../utils/catchAsync.ts";
import { createRoom, fetchRooms } from "./room.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";

export const createRoomController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { roomNumber, roomType, rent } = req.body;

    const apartmentId = req.userId as string;

    const response = await createRoom({
      roomNumber,
      roomType,
      rent,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 201,
      message: response.message,
    });
  },
);

export const fetchRoomsController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const apartmentId = req.userId as string;

    const response = await fetchRooms(apartmentId);

    sendResponse(res, {
      statusCode: 200,
      message: response.message,
      data: response.rooms,
    });
  },
);
