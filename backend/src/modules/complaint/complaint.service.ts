import Complaint from "../../models/complaint.model.ts";
import AppError from "../../utils/appError.ts";

export interface CreateComplaintRequest {
  title: string;
  description: string;
  tenantId: string;
  roomId: string;
  apartmentId: string;
}

export const createComplaint = async ({
  title,
  description,
  tenantId,
  roomId,
  apartmentId,
}: CreateComplaintRequest): Promise<{ message: string }> => {
  const response = await Complaint.create({
    title,
    description,
    tenantId,
    roomId,
    apartmentId,
  });

  if (!response) {
    throw new AppError("Failed to create complaint", 400);
  }

  return {
    message: "Complaint created successfully",
  };
};
