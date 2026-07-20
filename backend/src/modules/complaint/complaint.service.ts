import type mongoose from "mongoose";
import Complaint from "../../models/complaint.model.ts";
import AppError from "../../utils/appError.ts";

export interface CreateComplaintRequest {
  title: string;
  description: string;
  roomNumber: string;
  tenantName: string;
  tenantMobile: string;
  tenantId: string;
  roomId: string;
  apartmentId: string;
}

export interface SafeComplaint {
  id: mongoose.Types.ObjectId;
  title: string;
  description: string;
  roomNumber: string;
  status: string;
  tenantName: string;
  tenantMobile: string;
  createdAt: Date;
}

export interface UpdateComplaintRequest {
  complaintId: string;
  status: string;
}

export const createComplaint = async ({
  title,
  description,
  roomNumber,
  tenantName,
  tenantMobile,
  tenantId,
  roomId,
  apartmentId,
}: CreateComplaintRequest): Promise<{ message: string }> => {
  const response = await Complaint.create({
    title,
    description,
    roomNumber,
    tenantName,
    tenantMobile,
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

export const fetchComplaintsByApartment = async (
  apartmentId: string,
): Promise<{ message: string; data: SafeComplaint[] }> => {
  const complaints = await Complaint.find({ apartmentId });

  return {
    message: "Apartment Complaints Fetched Successfully",
    data: complaints.map((complaint) => {
      return {
        id: complaint._id,
        title: complaint.title,
        description: complaint.description,
        roomNumber: complaint.roomNumber,
        status: complaint.status,
        tenantName: complaint.tenantName,
        tenantMobile: complaint.tenantMobile,
        createdAt: complaint.createdAt,
      };
    }),
  };
};

export const updateComplaintStatus = async ({
  complaintId,
  status,
}: UpdateComplaintRequest): Promise<{ message: string }> => {
  const response = await Complaint.findByIdAndUpdate(
    complaintId,
    {
      status: status,
    },
    { new: true, runValidators: true },
  );

  if (!response) {
    throw new AppError("Failed to update complaint", 400);
  }

  return {
    message: "Complaint updated successfully",
  };
};
