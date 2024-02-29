# frozen_string_literal: true

class DistributionCenter < Fullfiller
  has_and_belongs_to_many :products, foreign_key: 'fullfiller_id'

  scope :find_fullfiller_for_given_product, lambda { |product_ids|
                                              joins(:products).where(products: { id: product_ids })
                                                              .group(:fullfiller_id)
                                                              .having('count(fullfiller_id) = ?', product_ids.size)
                                            }
end
